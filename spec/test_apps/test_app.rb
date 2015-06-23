class TestApp < Grape::API
  format :json

#  GrapeTokenAuth.authenticate!

  get '/' do
    authenticate_user!
    present Post.all
  end

  get '/helper_test' do
    authenticate_user!
    {
      current_user_uid: current_user.uid,
      authenticated?: authenticated?
    }
  end

  get '/unauthenticated_helper_test' do
    {
      current_user: current_user,
      authenticated?: authenticated?
    }
  end
end