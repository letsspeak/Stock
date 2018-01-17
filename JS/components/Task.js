import React from 'react'
import PropTypes from 'prop-types'

const Task = ({ title, completed, onClick }) => (
  <li
    onClick={onClick}
    style={{textDecoration: completed ? 'line-through' : 'none' }}
  >
    {title}
  </li>
)

Task.propTypes = {
  title: PropTypes.string.isRequired,
  completed: PropTypes.bool.isRequired,
  onClick: PropTypes.func.isRequired
}

export default Task
