class DropboxController < ApplicationController
  def new
    db_session = DropboxSession.new(DROPBOX_APP_KEY, DROPBOX_APP_SECRET)
    begin
      db_session.get_request_token
    rescue DropboxError => e
      render template: "multi_api/home/refresh"
    end

    session[:dp_request_db_session] = db_session.serialize

    # OAuth Step 2: Send the user to the Dropbox website so they can authorize
    # our app.  After the user authorizes our app, Dropbox will redirect them
    # to our 'dp_callback' endpoint.
    auth_url = db_session.get_authorize_url url_for(:dp_callback)
    redirect_to auth_url
  end

  def destroy
    session.delete(:dp_authorized_db_session)
    render :json => checkAuth
  end

  def isAuthenticated
    render :json => checkAuth
  end

  def checkAuth
    val = {'isAuthenticated' => false}
    begin
      unless not session[:dp_authorized_db_session]
        dbsession = DropboxSession.deserialize(session[:dp_authorized_db_session])
        client = DropboxClient.new(dbsession, MULTIAPI_CONFIG['dropbox']['accessType'])
        val = {'isAuthenticated' => true}
      end
    rescue DropboxError => e
      val = {'isAuthenticated' => false}
    end
    val
  end

  def callback
    # Finish OAuth Step 2
    ser = session[:dp_request_db_session]
    unless ser
      render template: "multi_api/home/refresh"
    return
    end
    db_session = DropboxSession.deserialize(ser)

    # OAuth Step 3: Get an access token from Dropbox.
    begin
      db_session.get_access_token
    rescue DropboxError => e
      render template: "multi_api/home/refresh"
    return
    end
    session.delete(:dp_request_db_session)
    session[:dp_authorized_db_session] = db_session.serialize
    render template: "multi_api/home/refresh"
  end

end