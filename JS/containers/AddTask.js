import React from 'react'
import { connect } from 'react-redux'
import { postTask } from '../actions'

let AddTask = ({ dispatch }) => {
  let input
    
  return (
    <div>
      <input ref={(node) => {
        input = node
      }} />
      <button onClick={() => {
        dispatch(postTask(input.value))
        input.value = ''
      }}>
        Add Task
      </button>
    </div>
  )
}
AddTask = connect()(AddTask)

export default AddTask
