import { applyMiddleware, compose, createStore, combineReducers } from 'redux';
import thunk from 'redux-thunk'

import blockchainReducer from './blockchain/blockchainReducer';


const rootReducer = combineReducers({
    blockchain: blockchainReducer
})

const middleware = [thunk];

const composeEnhancer = compose(applyMiddleware(...middleware));

const configureStore = () => {
    return createStore(rootReducer, composeEnhancer);
}

const store = configureStore();

export default store;