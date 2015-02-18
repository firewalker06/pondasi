module Pondasi
  class API < Grape::API
    version 'v1', using: :header, vendor: 'pondasi'
    format :json
    prefix :api

    resource :posts do
      desc "Return posts."
      get do
        Post.limit(20)
      end

      desc "Return a post."
      params do
        requires :id, type: Integer, desc: "Post id."
      end
      route_param :id do
        get do
          Post.find(params[:id])
        end
      end

      desc "Create a post."
      params do
        requires :title, type: String, desc: "Post title."
      end
      post do
        Post.create!({
          title: params[:title],
          description: params[:description]
        })
      end

      desc "Update a post."
      params do
        requires :id, type: String, desc: "Post ID."
        requires :title, type: String, desc: "Post title."
      end
      patch ':id' do
        Post.find(params[:id]).update({
          title: params[:title],
          description: params[:description]
        })
      end

      desc "Delete a post."
      params do
        requires :id, type: String, desc: "Post ID."
      end
      delete ':id' do
        Post.find(params[:id]).destroy
      end
    end
  end
end
