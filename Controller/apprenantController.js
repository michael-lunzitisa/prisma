import e from "express";
import prisma from "../DB/db.config";

export const createApprenant = async (req, res) => {
    const {
        matricule,
        prenom,
        nom,
        postnom,
        dateNaissance,
        adresse,
        email,
        telephone,
    } = req.body;

    const findApprenant = await prisma.apprenant.findUnique({
        where: {
            matricule: matricule,
        },
    });

    if (findApprenant) {
        return res.json({
            status: 400,
            message: "veilleiz entrer le matricule",
        });
    }

    const newApprenant = await prisma.apprenant.create({
        data: {
            matricule: matricule,
            prenom: prenom,
            nom: nom,
            postnom: postnom,
            dateNaissance: dateNaissance,
            adresse: adresse,
            email: email,
            telephone: telephone,
        },
    });
    return res.json({
        status: 201,
        data: newApprenant,
        message: "Création d'apprenants",
    });
};

export const getAllApprenants = async (req, res) => {
    const apprenants = await prisma.apprenant.findMany({});

    return res.json({ status: 200, data: apprenants });
};

export const showApprenant = async (req, res) => {
    const apprenantId = req.params.id;
    const apprenant = await prisma.apprenant.findFirst({
        where: {
            id: Number(apprenantId),
        },
    });

    return res.json({ status: 200, data: apprenant });
};

export const deleteApprenant = async (req, res) => {
    const apprenantId = req.params.id;
    await prisma.apprenant.delete({
        where: {
            id: Number(apprenantId),
        },
    });

    return res.json({ status: 200, msg: "Utilisateur supprimer avec succès" });
};
