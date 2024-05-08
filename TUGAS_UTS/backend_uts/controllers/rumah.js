import { Op } from "sequelize";
import Rumah from "../models/rumahModel.js"

export const getRumah = async (req, res) => {
  try {
    const { search } = req.query;
    let whereClause = {};

    if (search) {
      whereClause = {
        lokasi: {
          [Op.like]: `%${search}%`,
        },
      };
    }

    const result = await Rumah.findAll({
      where: whereClause,
    });

    if (result.length === 0) {
      res.status(404).json({ message: 'Data not found' });
    } else {
      res.status(200).json(result);
    }
  } catch (error) {
    console.error('Error in getRumah:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const addRumah = async (req, res) => {
  try {
 
    const {
      lokasi,
      judul_rumah,
      Harga,
    } = req.body;

    // Simpan data ke database
    const newRumah = await Rumah.create({
      lokasi,
      judul_rumah,
      Harga
    });

    // Kirim respons sukses ke client
    res.status(201).json({ message: 'Data successfully added', data: newRumah });
  } catch (error) {
    console.error('Error in addRumah:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const editRumah = async (req, res) => {
  try {
    // Ambil ID dari parameter URL
    const { id } = req.params;

    // Ambil data yang akan diubah dari body request
    const { lokasi, judul_rumah, Harga } = req.body;

    // Cari data rumah berdasarkan ID
    const existingRumah = await Rumah.findByPk(id);

    // Jika data tidak ditemukan, kirim respons 404
    if (!existingRumah) {
      return res.status(404).json({ error: 'Data not found' });
    }

    // Lakukan pembaruan data
    existingRumah.lokasi = lokasi;
    existingRumah.judul_rumah = judul_rumah;
    existingRumah.Harga = Harga;

    // Simpan perubahan ke database
    await existingRumah.save();

    // Kirim respons sukses ke client
    res.status(200).json({ message: 'Data successfully updated', data: existingRumah });
  } catch (error) {
    console.error('Error in editRumah:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const deleteRumah = async (req, res) => {
  const { id } = req.params;

  try {
    const deletedRumah = await Rumah.destroy({
      where: {
        id: id,
      },
    });

    if (deletedRumah === 1) {
      res.json({ message: "Data deleted successfully" });
    } else {
      res.status(404).json({ error: "Data not found" });
    }
  } catch (error) {
    console.error("Error deleting rumah:", error.message);
    res.status(500).json({ error: "Internal Server Error" });
  }
};
