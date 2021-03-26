import * as types from './types'

// INITIALIZES CLOCK ON SERVER
export const serverRenderClock = () => (dispatch) =>
  dispatch({
    type: types.TICK,
    payload: { light: false, ts: Date.now() },
  })

export const tick = () => ({ type: types.TICK, payload: { light: true, ts: Date.now() } });

// INITIALIZES CLOCK ON CLIENT
export const startClock = () => (dispatch) => {
  dispatch(tick());
  setInterval(() => {
    dispatch(tick());
  }, 10000)
};

// INCREMENT COUNTER BY 1
export const incrementCount = () => ({ type: types.INCREMENT })

// DECREMENT COUNTER BY 1
export const decrementCount = () => ({ type: types.DECREMENT })

// RESET COUNTER
export const resetCount = () => ({ type: types.RESET })
