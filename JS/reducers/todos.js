const todos = (state = [], action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        {
          id: state.length,
          text: action.text
        }
      ]
    default:
      return state
  }
}

export default todos
