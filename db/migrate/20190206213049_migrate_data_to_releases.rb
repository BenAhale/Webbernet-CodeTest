class MigrateDataToReleases < ActiveRecord::Migration[5.2]
  def change

    Push.where(status: 'released').each do |push|
      Release.create(
        title: push.release_title,
        body: push.release_body,
        status: 'published',
        released_at: push.released_at,
        release_set_id: push.release_set_id,
        project_id: push.project_id
      )
    end

    Push.where(status: 'not_released').each do |push|
      Release.create(
        title: 'No title',
        body: push.release_body,
        status: 'draft',
        release_set_id: push.release_set_id,
        project_id: push.project_id
      )
    end

  end
end
