import _service from '@netuno/service-client'
import config from '../config/config.json'

_service.config({
  prefix: config.api.services,
})
