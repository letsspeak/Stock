const todos = (state = [], action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        action.task
      ]
    case 'TOGGLE_TODO':
          return state.map((todo) => {
            if (todo.id !== action.id) return todo
            return Object.assign({}, todo, {completed: !todo.completed})
          })
    default:
      return state
  }
}

export default todos
