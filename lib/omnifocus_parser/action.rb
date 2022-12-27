module OmnifocusParser
  Action = Data.define(
    :task_id,
    :name,
    :status,
    :project,
    :context,
    :due_date,
    :completion_date,
    :duration,
    :start_date,
    :flagged,
    :notes,
    :tags
  )
end
