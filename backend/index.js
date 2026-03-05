const express = require('express');
const cors = require('cors');

const monstruosRoutes = require('./routes/monstruos');
const razasRoutes = require('./routes/razas');
const clasesRoutes = require('./routes/clases');
const hechizosRoutes = require('./routes/hechizos');
const authRoutes = require('./routes/auth-dialog');



const app = express();

app.use(cors());
app.use(express.json());

// Rutas
app.use('/api/monstruos', monstruosRoutes);
app.use('/api/razas', razasRoutes);
app.use('/api/clases', clasesRoutes);
app.use('/api/hechizos', hechizosRoutes);
app.use('/api/auth-dialog', authRoutes);

// Prueba de que el servidor funciona
app.get('/', (req, res) => {
  res.json({ mensaje: 'API DnD funcionando correctamente' });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
