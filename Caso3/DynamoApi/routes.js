import express from 'express'
import { createOrUpdate,
    readAll,
    getMainMenuById,
    deleteMainMenuById } from './db.js'

const router = express.Router()

// READ ALL
router.get('/mainMenu', async(req, res) => {
    const { success, data } = await readAll()

    if(success){
        return res.json({success, data})
    }
    return res.status(500).json({success:false, messsage: "Error"})
})

// Get Main Menu by ID
router.get('/mainMenu/:id', async(req, res) => {
    const { id } = req.params
    const { success, data } = await getMainMenuById(id)
    console.log(data)
    if(success){
        return res.json({success, data})
    }

    return res.status(500).json({success: false, message: "Error"})
})


// Create Main Menu
router.post('/mainMenu', async(req, res) => {
    const { success, data } = await createOrUpdate(req.body)

    if(success){
        return res.json({success, data})
    }

    return res.status(500).json({success: false, message: 'Error'})
})


// Update Main Menu by ID
router.put('/mainMenu/:id', async(req, res) => {
    const mainMenu = req.body
    const { id } = req.params
    mainMenu.id = parseInt(id)

    const { success, data } = await createOrUpdate(mainMenu)

    if(success){
        return res.json({success, data})
    }

    return res.status(500).json({success: false, message: "Error"})
})


// Delete Main Menu by Id
router.delete('/mainMenu/:id', async (req, res) => {
    const { id } = req.params
    const { success, data } = await deleteMainMenuById(id)
    if (success) {
      return res.json({ success, data })
    }
    return res.status(500).json({ success: false, message: 'Error'})
})
  



export default router