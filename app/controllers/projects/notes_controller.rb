class Projects::NotesController < Projects::ApplicationController
  # Authorize
  before_action :authorize_read_note!
  before_action :authorize_create_note!, only: [:create]
  before_action :authorize_admin_note!, only: [:update, :destroy]
  before_action :find_current_user_notes, except: [:upvote, :downvote, :destroy, :delete_attachment, :award_toggle]

  def upvote
    @note = Note.find(params[:id])
    if !note.voted_on_by? current_user
      @note.liked_by current_user

      issue = Issue.find(params[:issue_id])
      usuario = User.find(@note.author_id)

      if current_user.id == issue.author_id
        evento = Event.new(target_type: 'Thumbsup_Comment_Owner', target_id: 70, project_id: @note.project_id, action: 89, author_id: @note.author_id, pontuacao_obtida: 30)
      else
        evento = Event.new(target_type: 'Thumbsup_Comment', target_id: 71, project_id: @note.project_id, action: 90, author_id: @note.author_id, pontuacao_obtida: 20)
      end
      evento.save
    end    
    redirect_to :back
  end

  def downvote
    @note = Note.find(params[:id])

    if !note.voted_on_by? current_user

      @note.downvote_from current_user
      if (note.get_downvotes.size % 3) == 0
        usuario = User.find(@note.author_id)
        usuario.score = usuario.score - 50
        if usuario.score < 0
          usuario.score = 0
        end
        usuario.save
      end
    end

    redirect_to :back
  end

  def index
    current_fetched_at = Time.now.to_i

    notes_json = { notes: [], last_fetched_at: current_fetched_at }

    @notes.each do |note|
      next if note.cross_reference_not_visible_for?(current_user)

      notes_json[:notes] << note_json(note)
    end

    render json: notes_json
  end

  def create
    @note = Notes::CreateService.new(project, current_user, note_params).execute

    respond_to do |format|
      format.json { render json: note_json(@note) }
      format.html { redirect_back_or_default }
    end
  end

  def update
    @note = Notes::UpdateService.new(project, current_user, note_params).execute(note)

    respond_to do |format|
      format.json { render json: note_json(@note) }
      format.html { redirect_back_or_default }
    end
  end

  def destroy
    if note.editable?
      Notes::DeleteService.new(project, current_user).execute(note)
    end

    respond_to do |format|
      format.js { head :ok }
    end
  end

  def delete_attachment
    note.remove_attachment!
    note.update_attribute(:attachment, nil)

    respond_to do |format|
      format.js { head :ok }
    end
  end

  def award_toggle
    noteable = if note_params[:noteable_type] == "issue"
                 project.issues.find(note_params[:noteable_id])
               else
                 project.merge_requests.find(note_params[:noteable_id])
               end

    data = {
      author: current_user,
      is_award: true,
      note: note_params[:note].delete(":")
    }

    note = noteable.notes.find_by(data)

    if note
      note.destroy
    else
      Notes::CreateService.new(project, current_user, note_params).execute
    end

    render json: { ok: true }
  end

  private

  def note
    @note ||= @project.notes.find(params[:id])
  end

  def note_to_html(note)
    render_to_string(
      "projects/notes/_note",
      layout: false,
      formats: [:html],
      locals: { note: note }
    )
  end

  def note_to_discussion_html(note)
    return unless note.diff_note?

    if params[:view] == 'parallel'
      template = "projects/notes/_diff_notes_with_reply_parallel"
      locals =
        if params[:line_type] == 'old'
          { notes_left: [note], notes_right: [] }
        else
          { notes_left: [], notes_right: [note] }
        end
    else
      template = "projects/notes/_diff_notes_with_reply"
      locals = { notes: [note] }
    end

    render_to_string(
      template,
      layout: false,
      formats: [:html],
      locals: locals
    )
  end

  def note_to_discussion_with_diff_html(note)
    return unless note.diff_note?

    render_to_string(
      "projects/notes/_discussion",
      layout: false,
      formats: [:html],
      locals: { discussion_notes: [note] }
    )
  end

  def note_json(note)
    if note.valid?
      {
        valid: true,
        id: note.id,
        discussion_id: note.discussion_id,
        html: note_to_html(note),
        award: note.is_award,
        note: note.note,
        discussion_html: note_to_discussion_html(note),
        discussion_with_diff_html: note_to_discussion_with_diff_html(note)
      }
    else
      {
        valid: false,
        award: note.is_award,
        errors: note.errors
      }
    end
  end

  def authorize_admin_note!
    return access_denied! unless can?(current_user, :admin_note, note)
  end

  def note_params
    params.require(:note).permit(
      :note, :noteable, :noteable_id, :noteable_type, :project_id,
      :attachment, :line_code, :commit_id, :type
    )
  end

  def find_current_user_notes
    @notes = NotesFinder.new.execute(project, current_user, params)
  end
end
