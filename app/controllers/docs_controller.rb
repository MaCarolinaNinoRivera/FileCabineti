class DocsController < ApplicationController
    # Antes que se cargue elige el método a buscar el id
    before_action :find_doc, only: [:show, :edit, :update, :destroy]
    def index
        @docs = Doc.all.order("created_at DESC") #Este doc es la tabla que se creo
    end

    def show
    end

    def new
        @doc = Doc.new
    end

    def create
        @doc = Doc.new(doc_params)

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
