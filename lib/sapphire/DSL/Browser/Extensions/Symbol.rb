class Symbol

  def Clear
    ExecuteAgainstControl(self) do |control, arg|
      control.Set ""
    end
  end

  def Check
    ExecuteAgainstControl(self) do |control, arg|
      control.Check true
    end
  end

  def Click
    ExecuteAgainstControl(self) do |control, arg|
      control.Click
    end
  end

  def MouseOver
    ExecuteAgainstControl(self) do |control, arg|
      control.MouseOver
    end
  end

  def Uncheck
    ExecuteAgainstControl(self) do |control, arg|
      control.Check false
    end
  end

  def Set(hash)
    ExecuteHashAgainstControl(hash) do |control, arg|
      control.Set arg
    end
  end

  def Show(item, modifier)

    return FieldNotDefinedEvaluation.new(item, $page) if !$page.Contains item

    begin
      x = $page.Get(item).Find(modifier)

      return Evaluation.new(true, true) if x.nil? and modifier.Modify(true, false)

      return FieldNotFoundEvaluation.new(item, $page) if x == nil

      return Evaluation.new(x.displayed?, true) if modifier != nil and modifier.Modify(x.displayed?, true)

      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        result = wait.until { y = x.displayed?, true
          y unless y == false
        }

        z = VisibleModifier.new(Evaluation.new(x, x))
        z.ModifyWith(modifier)
        return z
      rescue
        return FieldNotFoundEvaluation.new(item, $page)
      end

    rescue
      return FieldNotFoundEvaluation.new(item, $page)
    end

  end

  def Fix(evaluation, modifier)
    modifier = EqualsModifier.new(evaluation) if modifier == nil
    modifier = modifier.Create(evaluation)

    modifier
  end

  def Hide(item, modifier)

    return FieldNotDefinedEvaluation.new(item, $page) if !$page.Contains item

    begin
      wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      element = wait.until { x = field[field_key].Find
          x and modifier.Modify(!x.displayed?, true)
      }
      if(element)
        x = Evaluation.new(element.displayed?, true)
        x.ModifyWith(modifier)
        return x
      end
    rescue
      z = Evaluation.new(true, true)
      z.ModifyWith(modifier)
      return z
    end

    return FieldNotDefinedEvaluation.new(item, $page)
  end

  def Validate(hash)
    GetPageField(hash[hash.keys.first]).Equals(hash.keys.first.to_s)
  end

  def +(item)
    return Parameter(self) + item if Sapphire::DSL::TestPlans::Parameters.instance.Contains(self)
    raise "No Parameter defined for: " << self.to_s
  end

end