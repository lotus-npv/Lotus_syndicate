module.exports = {
    apps: [
        {
            name: 'demo_api_student',
            script: './server.js',
            env: {
                NODE_ENV: 'production',
                PORT: 3000,
            }
        }
    ]
}