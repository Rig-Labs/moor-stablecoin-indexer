import assert from "assert";
import { TestHelpers, BorrowOperations_OwnershipSet } from "generated";
const { MockDb, BorrowOperations } = TestHelpers;

describe("BorrowOperations contract OwnershipSet event tests", () => {
  // Create mock db
  const mockDb = MockDb.createMockDb();

  // Creating mock for BorrowOperations contract OwnershipSet event
  const event = BorrowOperations.OwnershipSet.mock({
    data: {} /* It mocks event fields with default values, so you only need to provide data */,
  });

  it("BorrowOperations_OwnershipSet is created correctly", async () => {
    // Processing the event
    const mockDbUpdated = await BorrowOperations.OwnershipSet.processEvent({
      event,
      mockDb,
    });

    // Getting the actual entity from the mock database
    let actualBorrowOperationsOwnershipSet =
      mockDbUpdated.entities.BorrowOperations_OwnershipSet.get(
        `${event.chainId}_${event.block.height}_${event.logIndex}`
      );

    // Creating the expected entity
    const expectedBorrowOperationsOwnershipSet: BorrowOperations_OwnershipSet =
      {
        id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      };
    // Asserting that the entity in the mock database is the same as the expected entity
    assert.deepEqual(
      actualBorrowOperationsOwnershipSet,
      expectedBorrowOperationsOwnershipSet,
      "Actual BorrowOperationsOwnershipSet should be the same as the expectedBorrowOperationsOwnershipSet"
    );
  });
});
