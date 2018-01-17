import React from 'react'
import PropTypes from 'prop-types'
import Task from './Task'

const TaskList = ({ tasks, onTaskClick }) => (
  <ul>
    {tasks.map((task) =>
      <Task
        key={task.id}
        {...task}
        onClick={() => onTaskClick(task.id)}
      />
    )}
  </ul>
)

TaskList.propTypes = {
  tasks: PropTypes.arrayOf(PropTypes.shape({
    id: PropTypes.number.isRequired,
    title: PropTypes.string.isRequired,
    completed: PropTypes.bool.isRequired
  }).isRequired).isRequired,
  onTaskClick: PropTypes.func.isRequired
}

export default TaskList
