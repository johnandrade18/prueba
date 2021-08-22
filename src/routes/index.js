const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/' , (req , res)=>{

   res.send('hello from simple server :)')

})

// Rutas vuelos
router.get('/vuelos' , (req , res)=>{
    res.send('usuarios get')
 })
 router.get('/vuelos/arrivals/add' , (req , res)=>{
    res.render('vuelos/arrivals/add')
 })



// Rutas usuarios
router.get('/usuarios' , (req , res)=>{
    res.send('usuarios get')
 })
 router.get('/usuarios/add' , (req , res)=>{
    res.render('usuarios/add')
 })

module.exports = router;