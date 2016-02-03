class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.string :type_code
      t.string :type_description

      t.timestamps
    end
  end
end
