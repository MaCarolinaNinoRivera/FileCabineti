class DocsController < ApplicationController
    # Antes que se cargue elige el método a buscar el id
    before_action :find_doc, only: [:show, :edit, :update, :destroy]
    def index
        @docs = Doc.where(user_id: current_user) #Este doc es la tabla que se creo y solo se muestra los creados por los usuarios
    end

    def show
    end

    def new
        @doc = current_user.docs.build
    end

    def create
        @doc = current_user.docs.build(doc_params)

        if @doc.save
            redirect_to @doc
        else render 'new'
        end
    end

    def edit
    end

    def update
        # Si logra la actualización lleve a la lista
        if @doc.update(doc_params)
            redirect_to @doc
        else # Si no permanezca en edición
            render 'edit'
        end
    end

    def destroy
        @doc.destroy
        redirect_to docs_path
    end

    private

        def find_doc
            @doc = Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title, :content)
        end
end
