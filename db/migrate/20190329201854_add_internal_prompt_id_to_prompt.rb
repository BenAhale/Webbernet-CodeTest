class AddInternalPromptIdToPrompt < ActiveRecord::Migration[5.2]
  def change
    add_reference :prompts, :internal_prompt_release, foreign_key: { to_table: :releases }
  end
end
