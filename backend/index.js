const express = require('express');
const cors = require('cors');

const monstruosRoutes = require('./routes/monstruos');
const razasRoutes = require('./routes/razas');
const clasesRoutes = require('./routes/clases');
const hechizosRoutes = require('./routes/hechizos');
const authRoutes = require('./routes/auth');




const app = express();

app.use(cors());                            // línea 1 - permite que Angular (puerto 4200) hable con Node (puerto 3000)
app.use(express.json());                    // línea 2 - convierte el JSON que llega en un objeto JavaScript


// Rutas
app.use('/api/monstruos', monstruosRoutes);
app.use('/api/razas', razasRoutes);
app.use('/api/clases', clasesRoutes);
app.use('/api/hechizos', hechizosRoutes);
app.use('/api/auth', authRoutes);           // línea 3 - redirige las peticiones /api/auth a routes/auth.js



// Prueba de que el servidor funciona
app.get('/', (req, res) => {
  res.json({ mensaje: 'API DnD funcionando correctamente' });
});

const PORT = 3000; // Escucha en el puerto 3000
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
