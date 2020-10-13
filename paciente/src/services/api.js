import axios from 'axios'

import env from '../environments'

const api = axios.create({
    baseURL: env.host
})

export default api