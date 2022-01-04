//From Trailhead Developer Intermediate 
@isTest
public class AnimalLocatorTest {
    
    @isTest static  void testGetAnimalNameById()
    {
        // Create the mock response based on a static resource
        AnimalLocatorMock mock = new AnimalLocatorMock();
        
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        
        // Call method to test
        String result = AnimalLocator.getAnimalNameById(70);
        
        // Verify mock response is not null
        System.assertNotEquals(null,result,'The callout returned a null response.');
                        
        // Verify that the object name matches    
        System.assertEquals(result, 'rhinoceros','The name must be \'rhinoceros\'.');          
    }   
}