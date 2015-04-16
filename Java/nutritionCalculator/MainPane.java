/**
 * Author: Ryson Asuncion
 * Date Created: June 17, 2014
 * 
 * Last Updated: August 7, 2014 
 */

package nutritionCalculator;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.text.NumberFormat;

import javax.swing.BorderFactory;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;


public class MainPane extends JPanel implements PropertyChangeListener, ActionListener{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//////////// Instance variables for the resultsPane ///////////
	// Values for the fields
	protected static double proteinL = 0;
	protected static double fatsL = 0;
	protected static double carbsL = 0;

	protected static double proteinM = 0;
	protected static double fatsM = 0;
	protected static double carbsM = 0;

	protected static double proteinH = 0;
	protected static double fatsH = 0;
	protected static double carbsH = 0;

	// Strings for the labels of the fields
	private static String BMRString = "BMR";
	private static String adjBMRString = "Adjusted BMR";
	private static String proteinString = "Protein";
	private static String fatsString = "Fats";
	private static String carbsString = "Carbs";

	// Fields to display values
	private static JFormattedTextField proteinLField, fatsLField, carbsLField, 
								proteinMField, fatsMField, carbsMField,
								proteinHField, fatsHField, carbsHField,
								BMRField, adjBMRField;
	
	// Labels that will introduce each field
	private JLabel	proteinLLabel, fatsLLabel, carbsLLabel,
					proteinMLabel, fatsMLabel, carbsMLabel,
					proteinHLabel, fatsHLabel, carbsHLabel,
					BMRLabel, adjBMRLabel;

	// Formats for specific field values
	private NumberFormat macrosFormat;
	private NumberFormat BMRFormat;
	//////////////////////////////////////////////////////////////	
	
	
	//////////// Instance variables for the comboBoxPane /////////
	// Combo boxes
	private JComboBox activityCB, goalCB, genderCB, proteinCB;
	
	// Entries to pick from in each of the two combo boxes
	private String[] actLvls = {"Select Activity Level", "Sedentary", "Very Light Activity", "Light Activity", "Moderate Activity", 
								"Heavy Activity", "Extreme Activity"};
	private String[] goals = {"Select Goal", "Extreme Cut -20%", "Cut -10%", "Maintain ±0%",
							"Bulk +10%", "Extreme Bulk +20%"};
	private String[] gender = {"Select Gender", "Male", "Female"};
	private String[] proteinRatio = {"Select Protein Ratio", "0.8 g Protein / lb. Bodyweight", 
									"1.0 g Protein / lb. Bodyweight", "1.25 g Protein / lb. Bodyweight", 
									"1.5 g Protein / lb. Bodyweight"};
	
	
	// BMR scaled by the activity level, and summed with the goal percentages
	private double AdjBMR = 0;
	
	// Values that will correspond to a specific selection within the combo boxes
	private double actLvlFactor = 0;
	private double goalFactor = 0;
	private int genderConstant = 0;
	private double proteinConstant = .8;
	//////////////////////////////////////////////////////////////
	
	
	////////////Instance variables for the measurementsPane //////
	// Custom Color
	Color peach = new Color(220, 150, 150);
	
	// Values for the fields
	private double height = 0;
	private double weight = 0;
	private int age = 0;
	private double BMR = 0;
	
	// Labels that will introduce each text-field
	private JLabel heightLabel, weightLabel, ageLabel;

	// Strings for the labels
	private static String heightString = "Height (cm):";
	private static String weightString = "Weight (kg):";
	private static String ageString = "Age (yrs):";
	
	// Fields for data entry
	private JFormattedTextField heightField, weightField, ageField;
	
	// Custom formats for the numbers entered into the fields
	private NumberFormat hwFormat;
	private NumberFormat ageFormat;
	
	// Constants used for custom formatting
	private static int MAX_FRACTION_DIGITS = 2;
	private static int MAX_INTEGER_DIGITS = 3;
	private static int MIN_INTEGER_DIGITS = 1;
	//////////////////////////////////////////////////////////////
	
	/**
	 * Method: MainPane()
	 * 
	 * Description: Constructor for a MainPane instance
	 * 
	 */
	public MainPane() {
		super(new BorderLayout());
        setUpFormats();
        
        ///////////////////// "Fleshing out" the measurementsPane//////////////////////
        
        // Create the labels for the measurementsPane
        heightLabel = new JLabel(heightString);
        weightLabel = new JLabel(weightString);
        ageLabel = new JLabel(ageString);

        // Create each text field for the measurementsPane
        heightField = new JFormattedTextField(hwFormat);
        heightField.setValue(new Double(height));
        heightField.setColumns(10);
        heightField.addPropertyChangeListener("value", this);

        weightField = new JFormattedTextField(hwFormat);
        weightField.setValue(new Double(weight));
        weightField.setColumns(10);
        weightField.addPropertyChangeListener("value", this);

        ageField = new JFormattedTextField(ageFormat);
        ageField.setValue(new Double(age));
        ageField.setColumns(10);
        ageField.addPropertyChangeListener("value", this);

        // Connect the labels to the fields as pairs
        heightLabel.setLabelFor(heightField);
        weightLabel.setLabelFor(weightField);
        ageLabel.setLabelFor(ageField);

        //Lay out the labels in a panel.
        JPanel labelPane = new JPanel(new GridLayout(0,1));
        labelPane.add(heightLabel);
        labelPane.add(weightLabel);
        labelPane.add(ageLabel);
        labelPane.setBackground(peach);

        //Layout the text fields in a panel.
        JPanel fieldPane = new JPanel(new GridLayout(0,1));
        fieldPane.add(heightField);
        fieldPane.add(weightField);
        fieldPane.add(ageField);
        fieldPane.setBackground(peach);

        // Create the measurementsPane to hold the labelPane 
        // and fieldPane (labels on the left, fields on the right)
        JPanel measurementsPane = new JPanel(new BorderLayout());
        measurementsPane.add(labelPane, BorderLayout.CENTER);
        measurementsPane.add(fieldPane, BorderLayout.LINE_END);   
        measurementsPane.setBackground(peach);
        
        
        ///////////////////// "Fleshing out" the comboBoxPane//////////////////////
		// Create ComboBox for gender
        genderCB = new JComboBox(gender);
        genderCB.setSelectedIndex(0);
        genderCB.addActionListener(this);
        
        
		// Create ComboBox for activity levels
		activityCB = new JComboBox(actLvls);
		activityCB.setSelectedIndex(0);
		activityCB.addActionListener(this);
		
		// Create ComboBox for fitness goals
		goalCB = new JComboBox(goals);
		goalCB.setSelectedIndex(0);
		goalCB.addActionListener(this);
		
		// Create ComboBox for protein ratio
		proteinCB = new JComboBox(proteinRatio);
		proteinCB.setSelectedIndex(0);
		proteinCB.addActionListener(this);
		
		// Create the comboBoxPane
        JPanel comboBoxPane = new JPanel(new GridLayout(0,1));
        comboBoxPane.add(genderCB);
        comboBoxPane.add(activityCB);
        comboBoxPane.add(goalCB);
        comboBoxPane.add(proteinCB);
        comboBoxPane.setBackground(peach);
 
       
        ///////////////////// "Fleshing out" the ResultsPane//////////////////////
		
		// Create the labels
		proteinLLabel = new JLabel(proteinString);
		proteinMLabel = new JLabel(proteinString);
		proteinHLabel = new JLabel(proteinString);
		
		fatsLLabel = new JLabel(fatsString);
		fatsMLabel = new JLabel(fatsString);
		fatsHLabel = new JLabel(fatsString);
		
		carbsLLabel = new JLabel(carbsString);
		carbsMLabel = new JLabel(carbsString);
		carbsHLabel = new JLabel(carbsString);
		
		BMRLabel = new JLabel(BMRString);
		adjBMRLabel = new JLabel(adjBMRString);
		
		// Create each text field		
		// starting with the protein fields
		proteinLField = new JFormattedTextField(macrosFormat);
		proteinLField.setValue(new Double(proteinL));
		proteinLField.setColumns(5);
		proteinLField.setEditable(false);
		
		proteinMField = new JFormattedTextField(macrosFormat);
		proteinMField.setValue(new Double(proteinM));
		proteinMField.setColumns(5);
		proteinMField.setEditable(false);

		proteinHField = new JFormattedTextField(macrosFormat);
		proteinHField.setValue(new Double(proteinH));
		proteinHField.setColumns(5);
		proteinHField.setEditable(false);
		
		// Create the carbs fields
		carbsLField = new JFormattedTextField(macrosFormat);
		carbsLField.setValue(new Double(carbsL));
		carbsLField.setColumns(5);
		carbsLField.setEditable(false);
		
		carbsMField = new JFormattedTextField(macrosFormat);
		carbsMField.setValue(new Double(carbsM));
		carbsMField.setColumns(5);
		carbsMField.setEditable(false);

		carbsHField = new JFormattedTextField(macrosFormat);
		carbsHField.setValue(new Double(carbsH));
		carbsHField.setColumns(5);
		carbsHField.setEditable(false);
		
		// Create the fats fields
		fatsLField = new JFormattedTextField(macrosFormat);
		fatsLField.setValue(new Double(fatsL));
		fatsLField.setColumns(5);
		fatsLField.setEditable(false);
		
		fatsMField = new JFormattedTextField(macrosFormat);
		fatsMField.setValue(new Double(fatsM));
		fatsMField.setColumns(5);
		fatsMField.setEditable(false);

		fatsHField = new JFormattedTextField(macrosFormat);
		fatsHField.setValue(new Double(fatsH));
		fatsHField.setColumns(5);
		fatsHField.setEditable(false);
		
		// Create the BMR field
		BMRField = new JFormattedTextField(BMRFormat);
		BMRField.setValue(new Double(BMR));
		BMRField.setColumns(5);
		BMRField.setEditable(false);
		
		// Create the adjusted BMR field
		adjBMRField = new JFormattedTextField(BMRFormat);
		adjBMRField.setValue(new Double(AdjBMR));
		adjBMRField.setColumns(5);
		adjBMRField.setEditable(false);
		
		// Connect the labels to the fields as pairs
		proteinLLabel.setLabelFor(proteinLField);
		proteinMLabel.setLabelFor(proteinMField);
		proteinHLabel.setLabelFor(proteinHField);
		
		carbsLLabel.setLabelFor(carbsLField);
		carbsMLabel.setLabelFor(carbsMField);
		carbsHLabel.setLabelFor(carbsHField);
		
		fatsLLabel.setLabelFor(fatsLField);
		fatsMLabel.setLabelFor(fatsMField);
		fatsHLabel.setLabelFor(fatsHField);
		
		BMRLabel.setLabelFor(BMRField);
		adjBMRLabel.setLabelFor(adjBMRField);
		
		// Create panels to hold each days macro-nutrient quotas
		// starting with the BMR fields
		JPanel BMRLabelPane = new JPanel(new GridLayout(2,0));
		BMRLabelPane.add(BMRLabel);
		BMRLabelPane.add(adjBMRLabel);
		BMRLabelPane.setBackground(peach);
		JPanel BMRFieldPane = new JPanel(new GridLayout(2,0));
		BMRFieldPane.add(BMRField);
		BMRFieldPane.add(adjBMRField);
		BMRFieldPane.setBackground(peach);
		JPanel BMRPane = new JPanel(new GridLayout(0,2));
		BMRPane.add(BMRLabelPane);
		BMRPane.add(BMRFieldPane);
		BMRPane.setBackground(peach);
		
		
		// Create the panel to hold the info for the Low days
		JPanel lowLabelPanel = new JPanel(new GridLayout(3,0));
		lowLabelPanel.add(proteinLLabel);
		lowLabelPanel.add(carbsLLabel);
		lowLabelPanel.add(fatsLLabel); 
		lowLabelPanel.setBackground(peach);
		JPanel lowFieldPanel = new JPanel(new GridLayout(3,0));
		lowFieldPanel.add(proteinLField);
		lowFieldPanel.add(carbsLField);
		lowFieldPanel.add(fatsLField);
		lowFieldPanel.setBackground(peach);
		JPanel lowDayPanel = new JPanel(new GridLayout(0,2));
		lowDayPanel.add(lowLabelPanel);
		lowDayPanel.add(lowFieldPanel);
		lowDayPanel.setBackground(peach);
		lowDayPanel.setBorder(new TitledBorder("Low Carb Days"));
		
		// Create the panel to hold the info for the Moderate days
		JPanel modLabelPanel = new JPanel(new GridLayout(3,0));
		modLabelPanel.add(proteinMLabel);
		modLabelPanel.add(carbsMLabel);
		modLabelPanel.add(fatsMLabel); 
		modLabelPanel.setBackground(peach);
		JPanel modFieldPanel = new JPanel(new GridLayout(3,0));
		modFieldPanel.add(proteinMField);
		modFieldPanel.add(carbsMField);
		modFieldPanel.add(fatsMField);
		modFieldPanel.setBackground(peach);
		JPanel modDayPanel = new JPanel(new GridLayout(0,2));
		modDayPanel.add(modLabelPanel);
		modDayPanel.add(modFieldPanel);
		modDayPanel.setBackground(peach);
		modDayPanel.setBorder(new TitledBorder("Moderate Carb Days"));
		
		// Create the panel to hold the info for the High days
		JPanel hiLabelPanel = new JPanel(new GridLayout(3,0));
		hiLabelPanel.add(proteinHLabel);
		hiLabelPanel.add(carbsHLabel);
		hiLabelPanel.add(fatsHLabel); 
		hiLabelPanel.setBackground(peach);
		JPanel hiFieldPanel = new JPanel(new GridLayout(3,0));
		hiFieldPanel.add(proteinHField);
		hiFieldPanel.add(carbsHField);
		hiFieldPanel.add(fatsHField);
		hiFieldPanel.setBackground(peach);
		JPanel hiDayPanel = new JPanel(new GridLayout(0,2));
		hiDayPanel.add(hiLabelPanel);
		hiDayPanel.add(hiFieldPanel);
		hiDayPanel.setBackground(peach);
		hiDayPanel.setBorder(new TitledBorder("High Carb Days"));
		
		// Create the ResultsPane and add each (Low/Mod/High)DayPanel vertically
		JPanel resultsPane = new JPanel(new GridLayout(4,0));
		resultsPane.add(BMRPane);
		resultsPane.add(lowDayPanel);
		resultsPane.add(modDayPanel);
		resultsPane.add(hiDayPanel);
		resultsPane.setBackground(peach);
		
        
        ///////////////////// Adding all three panes to this pane//////////////////////
        setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        add(measurementsPane, BorderLayout.NORTH);
        add(comboBoxPane, BorderLayout.CENTER);
        add(resultsPane, BorderLayout.SOUTH);
        setBackground(peach);
	}

	/**
	 * @Method: setUpFormats()
	 * 
	 * @Description: specifies certain kinds of formats that each text field will use
	 * 
	 */
	public void setUpFormats() {
		hwFormat = NumberFormat.getNumberInstance();
		hwFormat.setMaximumFractionDigits(MAX_FRACTION_DIGITS);
		hwFormat.setMaximumIntegerDigits(MAX_INTEGER_DIGITS);
		hwFormat.setMinimumFractionDigits(MIN_INTEGER_DIGITS);
		
		ageFormat = NumberFormat.getNumberInstance();
		ageFormat.setMaximumFractionDigits(-1);
		ageFormat.setMaximumIntegerDigits(MAX_INTEGER_DIGITS);
		
		macrosFormat = NumberFormat.getNumberInstance();
		macrosFormat.setMaximumFractionDigits(-1);
		macrosFormat.setMaximumIntegerDigits(3);
		
		BMRFormat = NumberFormat.getNumberInstance();
		BMRFormat.setMaximumFractionDigits(-1);
		BMRFormat.setMaximumIntegerDigits(4);
	}


	/**
	 * @Method: propertyChange()
	 * 
	 * @Description: updates the appropriate values if either the height, weight or age fields are changed
	 * 
	 */
	@Override
	public void propertyChange(PropertyChangeEvent evt) {
		  Object source = evt.getSource();
	        if (source == heightField) {
	            if (((Number)heightField.getValue()).doubleValue() < 0) heightField.setValue(0);
	            height = ((Number)heightField.getValue()).doubleValue();
	        } else if (source == weightField) {
	        	if (((Number)weightField.getValue()).doubleValue() < 0) weightField.setValue(0);
	        	weight = ((Number)weightField.getValue()).doubleValue();
	        } else if (source == ageField) {
	        	if (((Number)ageField.getValue()).intValue() < 0) ageField.setValue(0);
	            age = ((Number)ageField.getValue()).intValue();
	        }
	        
	       
	        BMR = computeBMR(height, weight, age); 
	        AdjBMR = computeAdjBMR(BMR, actLvlFactor, goalFactor);
	        calcMacros(); 
	}


	/**
	 * @Method: actionPerformed()
	 * 
	 * @Description: udpdates the actLvlFactor and goalFactor values based on what is chosen in the combo boxes
	 * 
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		JComboBox cb = (JComboBox)e.getSource();
	    String selected = (String)cb.getSelectedItem();
	    
	    //if (selected.equals("Select Activity Level")) actLvlFactor = 0;
	    if (selected.equals("Sedentary")) actLvlFactor = 1.0;
	    if (selected.equals("Very Light Activity")) actLvlFactor = 1.2;
	    if (selected.equals("Light Activity")) actLvlFactor = 1.4;
	    if (selected.equals("Moderate Activity")) actLvlFactor = 1.6;
	    if (selected.equals("Heavy Activity")) actLvlFactor = 1.8;
	    if (selected.equals("Extreme Activity")) actLvlFactor = 2.0;
	    
	    if (selected.equals("Extreme Cut -20%")) goalFactor = -.20;
	    if (selected.equals("Cut -10%")) goalFactor = -.10;
	    if (selected.equals("Maintain ±0%")) goalFactor = 0.0;
	    if (selected.equals("Bulk +10%")) goalFactor = .10;
	    if (selected.equals("Extreme Bulk +20%")) goalFactor = .20;
	    
	    if (selected.equals("Male")) genderConstant = 0;
	    if (selected.equals("Female")) genderConstant = 1;
	    
	    if (selected.equals("0.8 g Protein / lb. Bodyweight")) proteinConstant = 0.8;
	    if (selected.equals("1.0 g Protein / lb. Bodyweight")) proteinConstant = 1.0;
	    if (selected.equals("1.25 g Protein / lb. Bodyweight")) proteinConstant = 1.25;
	    if (selected.equals("1.5 g Protein / lb. Bodyweight")) proteinConstant = 1.5;
	    
	    BMR = computeBMR(height, weight, age);
        AdjBMR = computeAdjBMR(BMR, actLvlFactor, goalFactor);
        calcMacros(); 
	}


	/**
	 * @Method: calcMacros()
	 * 
	 * @Description: calculates the values for each macronutrient for
	 * 				each type of day
	 * 
	 */
	public void calcMacros() {
		// Moderate days
		if (goalFactor < 0) {
			carbsM = 1.25 * weight*2.2;
		}
		else carbsM = proteinConstant * weight*2.2;
		
		proteinM = proteinConstant * weight*2.2;
		fatsM = (AdjBMR - (4 * proteinM) - (4 * carbsM)) / 9;
		
		// Low days
		carbsL = .75 * carbsM;
		proteinL = proteinConstant * weight*2.2;
		fatsL = fatsM;
					
		// High days
		carbsH = 1.25 * carbsM;
		proteinH = proteinConstant * weight*2.2;
		fatsH = fatsM;
						
		setMacros();
	}


	/**
	 * @Method: setMacros()
	 * 
	 * @Description: updates the field values to display the calculated
	 * 				macro-nutrient values
	 * 
	 */
	public void setMacros(){
		proteinLField.setValue(proteinL);
		proteinMField.setValue(proteinM);
		proteinHField.setValue(proteinH);
		
		carbsLField.setValue(carbsL);
		carbsMField.setValue(carbsM);
		carbsHField.setValue(carbsH);
		
		if (fatsL < 0) fatsLField.setValue(0);
		else fatsLField.setValue(fatsL);
		
		if (fatsM < 0) fatsMField.setValue(0);
		else fatsMField.setValue(fatsM);
		
		if (fatsH < 0) fatsHField.setValue(0);
		else fatsHField.setValue(fatsH);
		
		BMRField.setValue(BMR);
		adjBMRField.setValue(AdjBMR);
	}


	/**
	 * @Method: computeBMR()
	 * 
	 * @Description: calculates the BMR based off of someone's body measurements
	 * 
	 * @return double
	 * 
	 */
	public double computeBMR(double height, double weight, int age) {
		if (weight < 0) weight = 0;
		if (height < 0) height = 0;
		if (age < 0) age = 0;
		if (genderConstant == 0) return 66 +(13.70 * weight) + (5.00 * height) - (6.8 * age); // if Male
		else return 655 +(9.6 * weight) + (1.7 * height) - (4.7 * age); // if Female
	}

	/**
	 * @Method computeAdjBMR()
	 * 
	 * @Description calculates the adjusted BMR using the activity level factor and personal goals
	 * 
	 * @return double
	 * 
	 */
	public double computeAdjBMR(double BMR, double actLvlFactor, double goalFactor) {
		double temp = BMR * actLvlFactor;
		return (temp * goalFactor) + temp;
	}
}