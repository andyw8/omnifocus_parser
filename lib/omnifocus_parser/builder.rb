module OmnifocusParser
  class Builder
    MAPPING = {
      "Project" => Project,
      "Action" => Action
    }

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
      flagged = row.fetch("Flagged") == "1"
      notes = row.fetch("Notes")
      tags = row.fetch("Tags")&.split(",")

      MAPPING.fetch(type).new(
        task_id: task_id,
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
