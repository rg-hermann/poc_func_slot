const { app } = require('@azure/functions');

app.http('pocslot', {
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    authLevel: 'anonymous',
    handler: async (request, context) => {
        context.log(`Http function processed request for url "${request.url}"`);

        const method = request.method;

        switch (method) {
            case 'GET': {
                const name = request.query.get('name') || 'world';
                return {
                    status: 200,
                    body: { message: `Hello, ${name}!` }
                };
            }
            case 'POST': {
                const data = await request.json();
                return {
                    status: 201,
                    body: { message: 'Data received successfully', data }
                };
            }
            case 'PUT': {
                const data = await request.json();
                return {
                    status: 200,
                    body: { message: 'Data updated successfully', data }
                };
            }
            case 'DELETE': {
                const id = request.query.get('id');
                if (!id) {
                    return {
                        status: 400,
                        body: { error: 'ID is required for deletion' }
                    };
                }
                return {
                    status: 200,
                    body: { message: `Resource with ID ${id} deleted successfully` }
                };
            }
            default: {
                return {
                    status: 405,
                    body: { error: `Method ${method} not allowed` }
                };
            }
        }
    }
});
