/*
  Warnings:

  - Added the required column `sessionId` to the `Apprenant` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Apprenant" ADD COLUMN     "sessionId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Session" (
    "id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "ville" TEXT NOT NULL,
    "duree" TEXT NOT NULL,
    "creneau" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "places_disponibles" INTEGER NOT NULL,
    "heure" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Animer" (
    "id" SERIAL NOT NULL,
    "cohorteId" INTEGER NOT NULL,
    "sessionId" INTEGER NOT NULL,

    CONSTRAINT "Animer_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Apprenant" ADD CONSTRAINT "Apprenant_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animer" ADD CONSTRAINT "Animer_cohorteId_fkey" FOREIGN KEY ("cohorteId") REFERENCES "Cohorte"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animer" ADD CONSTRAINT "Animer_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
