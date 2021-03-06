          class TodosController < ApplicationController
            before_action :set_todo, only: [:show, :edit, :update, :destroy]

            def index
              @todos = Todo.all
            end

            def new
              @todo = Todo.new
            end
            
            def create
              @todo = Todo.new(todo_params)
              respond_to do |format|
                if @todo.save
                  format.html {redirect_to projects_url }
                end
              end
            end

            def update
              respond_to do |format|
              if @todo.update(todo_params)
                format.html {redirect_to projects_url}
              end
              end
            end

            def destroy
              @todo.destroy
              respond_to do |format|
                format.html {redirect_to projects_url}
              end
            end

            private
              def set_todo
                @todo = Todo.find(params[:id])
              end

              def todo_params
                params.require(:todo).permit(:text, :isCompleted, :project_id)
              end
          end
