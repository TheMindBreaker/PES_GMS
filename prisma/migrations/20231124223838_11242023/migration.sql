/*
  Warnings:

  - A unique constraint covering the columns `[hostid]` on the table `genset` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `hostid` to the `genset` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `genset` ADD COLUMN `hostid` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `genset_hostid_key` ON `genset`(`hostid`);
