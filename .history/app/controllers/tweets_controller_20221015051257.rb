class TweetsController < ApplicationController
    def index
        @tweets= Tweet.all

    end
    def new

        @tweet = Tweet.new
    end
    def create
        tweet = Tweet.new(tweet_params)
        tasks = []
        tasks.push(params[:tweet][:task1],params[:tweet][:task2],params[:tweet][:task3],params[:tweet][:task4])
        tasks.sort_by!{rand}
        for i in 0..tasks.length do
            tweet["task#{i+1}"] = tasks[i]
        end
        # tasks.each.with_index(1) do |a,i|
        #     tweet.task[i] = a
        # end
        # for i in task.length
        #     tweet.task{i} = tasks[i]
        # end
        # tweet.task1 = tasks[0]
        # tweet.task2 = tasks[1]
        # tweet.task3 = tasks[2]
        # tweet.task4 = tasks[3]
        if tweet.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
    end
    def edit
        @tweet = Tweet.find(params[:id])
    end
    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id
        else
            redirect_to :action => "new"
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    private
    def tweet_params
        params.require(:tweet).permit(:name,:content,:task1,:task2,:task3,:task4, button_ids: [] ) 
    end
end

