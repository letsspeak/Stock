const tasks = (state = [], action) => {
  switch (action.type) {
    case 'ADD_TASK':
      return [
        ...state,
        action.task
      ]
    case 'TOGGLE_TASK':
      return state.map((task) => {
        if (task.id !== action.id) return task
        return Object.assign({}, task, {completed: !task.completed})
      })
    default:
      return state
  }
}

export default tasks
