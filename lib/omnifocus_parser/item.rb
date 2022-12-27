module OmnifocusParser
  Item = Data.define(
    :task_id,
    :type,
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
  ) do
    def self.from_row(row)
      task_id = row.fetch("Task ID")
      type = row.fetch("Type")
      name = row.fetch("Name")
      status = row.fetch("Status")
      project = row.fetch("Project")
      context = row.fetch("Context")
      due_date = row.fetch("Due Date")
      completion_date = row.fetch("Completion Date")&.then { Date.parse(_1) }
      duration = row.fetch("Duration")
      start_date = row.fetch("Start Date")&.then { Date.parse(_1) }
      flagged = row.fetch("Flagged")
      notes = row.fetch("Notes")
      tags = row.fetch("Tags")&.split(",")

      new(
        task_id: task_id,
        type: type,
        name: name,
        status: status,
        project: project,
        context: context,
        due_date: due_date,
        completion_date: completion_date,
        duration: duration,
        start_date: start_date,
        flagged: flagged,
        notes: notes,
        tags: tags
      )
    end
  end
end
