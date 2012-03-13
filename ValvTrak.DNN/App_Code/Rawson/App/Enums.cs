namespace Rawson.App
{
    public enum JobTypeEnum
    {
        Inspection = 1,
        Maintenance = 2,
        Troubleshoot = 3,
        Repair = 4,
        Testing = 5,
        Greasing = 6,
        Install = 7,
        Exchange = 8,
        ShopRepair = 9,
        FSR = 10,
        WellSafety = 11,
        ChemPump = 12
    };

    public enum EditModeEnum
    {
        Unknown = 0,
        ReadOnly = 1,
        Edit = 2,
        Insert = 3
    };

    public enum ValveTestResultEnum
    {
        Unknown = 0,
        TestedGood = 5,
        NeedsRepair = 6,
        NeedsReplaced = 7
    };

    public enum AppMessageTypeEnum
    {
       Information,
       Error
    };

    public enum RoleEnum
    {
        Admin,
        Customer,
        DataEntry,
        Employee,
        SystemAdmin
    }
}