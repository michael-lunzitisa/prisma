/*
  Warnings:

  - Added the required column `sexe` to the `Apprenant` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Apprenant" ADD COLUMN     "sexe" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Affecter" (
    "id" SERIAL NOT NULL,
    "cohorteId" INTEGER NOT NULL,
    "coachId" INTEGER NOT NULL,

    CONSTRAINT "Affecter_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Affecter" ADD CONSTRAINT "Affecter_coachId_fkey" FOREIGN KEY ("coachId") REFERENCES "Coach"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Affecter" ADD CONSTRAINT "Affecter_cohorteId_fkey" FOREIGN KEY ("cohorteId") REFERENCES "Cohorte"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
