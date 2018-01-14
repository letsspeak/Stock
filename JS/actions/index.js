import axios from 'axios'

export const addTodo = (text) => {
  return {
    type: 'ADD_TODO',
    text
  }
}

export const postTodo = (text) => {
  return (dispatch) => {
    dispatch({ type: 'POST_TODO' })
    return axios.post('/api/todos', {
        title: text
      })
      .then(response => dispatch(addTodo(text)))
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
