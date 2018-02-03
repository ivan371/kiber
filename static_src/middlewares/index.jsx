import { apiMiddleware } from 'redux-api-middleware';
import {logger} from "./logger";
import {headerMiddleware} from "./header";

export default [
    apiMiddleware,
    logger,
    headerMiddleware,
];