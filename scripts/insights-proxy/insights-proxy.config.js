/*global module, process*/

// Hack so that Mac OSX docker can sub in host.docker.internal instead of localhost
// see https://docs.docker.com/docker-for-mac/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host
const localhost = (process.env.PLATFORM === 'linux') ? 'localhost' : 'host.docker.internal';

module.exports = {
    routes: {
        //
        // APIs
        //
        '/api/sources/v1.0': {host: `http://${localhost}:3002`},
        '/api/topological-inventory/v1.0': {host: `http://${localhost}:3001`},
        // '/api/catalog/v1.0': {host: `http://${localhost}:3003`},
        // '/api/approval/v1.0': {host: `http://${localhost}:3004`},

        //
        // Sources UI
        //
        // '/beta/hybrid/settings/sources': {host: `http://${localhost}:8002`},
    }
};
