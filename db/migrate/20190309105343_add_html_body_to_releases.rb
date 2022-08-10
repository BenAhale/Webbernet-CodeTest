class AddHtmlBodyToReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :html_body, :string
    Release.all.each do |release|
      next unless release.body.present?
      html_body = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML, autolink: true, tables: true, lax_spacing: true
      ).render(release.body)
      release.update(html_body: html_body)
    end
  end
end
