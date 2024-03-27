-- CreateTable
CREATE TABLE "Apprenant" (
    "id" SERIAL NOT NULL,
    "matricule" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "postnom" TEXT NOT NULL,
    "date_naissance" TIMESTAMP(3) NOT NULL,
    "adresse" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "cohorteId" INTEGER NOT NULL,

    CONSTRAINT "Apprenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cohorte" (
    "id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "date_debut" TIMESTAMP(3) NOT NULL,
    "date_fin" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Cohorte_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Apprenant_matricule_key" ON "Apprenant"("matricule");

-- CreateIndex
CREATE UNIQUE INDEX "Apprenant_email_key" ON "Apprenant"("email");

-- AddForeignKey
ALTER TABLE "Apprenant" ADD CONSTRAINT "Apprenant_cohorteId_fkey" FOREIGN KEY ("cohorteId") REFERENCES "Cohorte"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
