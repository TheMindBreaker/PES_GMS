-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `password` VARCHAR(191) NULL,
    `userType` INTEGER NOT NULL DEFAULT 0,
    `userStatus` BOOLEAN NOT NULL DEFAULT true,

    UNIQUE INDEX `user_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `userGensets` (
    `userId` INTEGER NOT NULL,
    `gensetId` INTEGER NOT NULL,
    `assignedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`userId`, `gensetId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `userGensets` ADD CONSTRAINT `userGensets_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `userGensets` ADD CONSTRAINT `userGensets_gensetId_fkey` FOREIGN KEY (`gensetId`) REFERENCES `genset`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
