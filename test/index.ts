import { expect } from "chai";
import { ethers } from "hardhat";
import { Signer, ContractFactory, BigNumber, utils } from "ethers";

let signers: Signer[];
let deployer: Signer, operator: Signer;

const epochLengthInSeconds = 43200;

before(async () => {
    signers = await ethers.getSigners();
    [deployer, operator, ...signers] = signers;
});

describe("Boledo", function () {
    let boledo: any;
    beforeEach(async () => {
        const bolidoFactory = await ethers.getContractFactory("Bolido");
        boledo = await bolidoFactory.deploy(operator, epochLengthInSeconds);
        await boledo.connect(deployer).deployed();
    });

    it("Have an epoch length set", async function () {
        expect(await boledo.epochLength).to.equal(epochLengthInSeconds);
    });
});
