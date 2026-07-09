public with sharing class DonorTaskService {

    public static void formatSubject(List<Task> tasks) {

        for (Task t : tasks) {

            // Enhanced logic: Check if prefix already exists

            if (t.Subject != null && !t.Subject.startsWith('[Donor Report]')) {

                t.Subject = '[Donor Report] ' + t.Subject;

            }

        }

    }
    
    public static void createDonorTask(Id donorId, String taskDescription, Integer daysUntilFollowUp) {

        // Create the task with follow-up date

        Task newTask = new Task();

        newTask.WhoId = donorId;

        newTask.Subject = taskDescription;

        newTask.Status = 'Not Started';

        newTask.ActivityDate = Date.today().addDays(daysUntilFollowUp);

        newTask.Follow_Up_Date__c = Date.today().addDays(daysUntilFollowUp);  // ← New field reference

        insert newTask;

    }

}