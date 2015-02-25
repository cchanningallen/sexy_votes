class IssuesController < ApplicationController
  expose(:issues)
  expose(:issues_presenter) { issues.decorate }
  expose(:issue, attributes: :issue_params)
  expose(:issue_presenter) { issue.decorate }

  # POST /issues
  # POST /issues.json
  def create
    respond_to do |format|
      if issue.save
        format.html { redirect_to issue, notice: 'Issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: issue }
      else
        format.html { render action: 'new' }
        format.json { render json: issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if issue.save
        format.html { redirect_to issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(
      :name,
      :type,
      :user_id,
      :team_id
    ).tap do |whitelisted|
      whitelisted[:score_options] = params[:score_options]
    end
  end
end
