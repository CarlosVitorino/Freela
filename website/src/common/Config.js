import config from '../config/config.json';
import _service from '@netuno/service-client';
console.log(_service);
_service.config({
    prefix: config.api.services
});