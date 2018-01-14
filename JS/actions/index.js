import axios from 'axios'

export const addTodo = (task) => {
  return {
    type: 'ADD_TODO',
    task
  }
}

export const postTodo = (title) => {
  return (dispatch) => {
    dispatch({ type: 'POST_TODO' })
    return axios.post('/api/todo/tasks', {
        title: title
      })
      .then(response => dispatch(addTodo(response.data)))
      .catch(error => console.log(error))
  }
}

export const toggleTodo = (id) => {
  return {
    type: 'TOGGLE_TODO',
      id
  }
}

export const setVisibilityFilter = (filter) => {
  return {
    type: 'SET_VISIBILITY_FILTER',
    filter
  }
}
