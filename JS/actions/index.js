import axios from 'axios'

export const addTask = (task) => {
  return {
    type: 'ADD_TASK',
    task
  }
}

export const postTask = (title) => {
  return (dispatch) => {
    dispatch({ type: 'POST_TODO' })
    return axios.post('/api/todo/tasks', {
        title: title
      })
      .then(response => dispatch(addTask(response.data)))
      .catch(error => console.log(error))
  }
}

export const toggleTask = (id) => {
  return {
    type: 'TOGGLE_TASK',
      id
  }
}

export const setVisibilityFilter = (filter) => {
  return {
    type: 'SET_VISIBILITY_FILTER',
    filter
  }
}
