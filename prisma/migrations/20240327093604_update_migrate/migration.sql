/*
  Warnings:

  - You are about to drop the column `cohorteId` on the `Animer` table. All the data in the column will be lost.
  - Added the required column `coachId` to the `Animer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `machineId` to the `Apprenant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sessionId` to the `Cohorte` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Animer" DROP CONSTRAINT "Animer_cohorteId_fkey";

-- AlterTable
ALTER TABLE "Animer" DROP COLUMN "cohorteId",
ADD COLUMN     "coachId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Apprenant" ADD COLUMN     "machineId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Cohorte" ADD COLUMN     "sessionId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Machine" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "fabriquant" TEXT NOT NULL,
    "modele" TEXT NOT NULL,
    "numero_serie" TEXT NOT NULL,

    CONSTRAINT "Machine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Utiliser" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "machineId" INTEGER NOT NULL,

    CONSTRAINT "Utiliser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coach" (
    "id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "sexe" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "adresse" TEXT NOT NULL,
    "expertise" TEXT NOT NULL,
    "date_de_naissance" TIMESTAMP(3) NOT NULL,
    "telephone" TEXT NOT NULL,

    CONSTRAINT "Coach_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Coach_email_key" ON "Coach"("email");

-- AddForeignKey
ALTER TABLE "Apprenant" ADD CONSTRAINT "Apprenant_machineId_fkey" FOREIGN KEY ("machineId") REFERENCES "Machine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cohorte" ADD CONSTRAINT "Cohorte_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animer" ADD CONSTRAINT "Animer_coachId_fkey" FOREIGN KEY ("coachId") REFERENCES "Coach"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Utiliser" ADD CONSTRAINT "Utiliser_machineId_fkey" FOREIGN KEY ("machineId") REFERENCES "Machine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Utiliser" ADD CONSTRAINT "Utiliser_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
