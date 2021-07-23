const middleware = (store) => {
    return (next) => {
        return(action) => {
            if (typeof action === 'function') {
                return action(store.dispatch, store.getState);
            }
            return next(action);
        }
    }
}

export default middleware;

// const middleware = ({dispatch, getState}) => next => action => {
//     if (typeof action === 'function') {
//         return action(dispatch, getState);
//     }
//     return next(action);
// }